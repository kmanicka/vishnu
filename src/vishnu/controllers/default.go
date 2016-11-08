package controllers

import (
	"fmt"
	"os"
	"log"
	"github.com/astaxie/beego"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/pkg/api/v1"
	"k8s.io/client-go/pkg/api/errors"
	"k8s.io/client-go/pkg/api/unversioned"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/pkg/labels"
	"k8s.io/client-go/pkg/util/intstr"
	"k8s.io/client-go/pkg/apis/extensions/v1beta1"
)


var (
	ENV_KUBERNETES_URL = os.Getenv("KUBERNETES_URL")
	ENV_KUBERNETES_NAMESPACE = os.Getenv("KUBERNETES_NAMESPACE")
	ENV_KUBERNETES_BEARER_TOKEN = os.Getenv("KUBERNETES_BEARER_TOKEN")
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.tpl"
}

type BlankController struct {
	beego.Controller
}

func (c *BlankController) Get() {
	c.TplName = "blank.tpl"
}


func getKubernetesClient() *kubernetes.Clientset {
	
	config, err := rest.InClusterConfig()
	if err != nil {
		config = &rest.Config{
		  Host:     ENV_KUBERNETES_URL,
		  BearerToken: ENV_KUBERNETES_BEARER_TOKEN,
		  Insecure: true,
		}
	}
		
	k8sclientset,err := kubernetes.NewForConfig(config)
	if err != nil {
		fmt.Printf("Couldn't initilise Kubernetes client\n",err)
		panic(err.Error())
		
	} 
	
	return k8sclientset
}


type CreateAppController struct {
	beego.Controller
}

func (c *CreateAppController) Get() {	
	fmt.Printf("CreateAppController %s, %s, %s, %s  \n", c.GetString("apptype"),c.GetString("appname"), c.GetString("dockerimage"), c.GetString("appport"))
	
	appname := c.GetString("appname")
	image := c.GetString("dockerimage")
	port,err := c.GetInt("appport")
	if err != nil {
		panic(err.Error())
	}
		
	kubernetesClient := getKubernetesClient()
	
	var op operation
	op = &deployOperation{
			image: image,
			name:  appname,
			port:  port,
		}

	op.Do(kubernetesClient)
	
	c.Redirect("/viewapp?appname=" + appname, 302)
}



type ViewClusterController struct {
	beego.Controller
}


func (c *ViewClusterController) Get() {	
	fmt.Printf("ViewClusterController \n")
	
	namespace := ENV_KUBERNETES_NAMESPACE
	kubernetesClient := getKubernetesClient()
	
	pods, err := kubernetesClient.Core().Pods(namespace).List(v1.ListOptions{})
	if err != nil {
		panic(err.Error())
	}

	services, err := kubernetesClient.Core().Services(namespace).List(v1.ListOptions{})
	if err != nil {
		panic(err.Error())
	} 
	
	c.Data["namespace"] = namespace

	c.Data["services"] = services
	c.Data["servicelist"] = services.Items
	
	c.Data["pods"] = pods
	c.Data["podlist"] = pods.Items

	c.TplName = "view_cluster.tpl"
}


type CreateAppListController struct {
	beego.Controller
}

func (c *CreateAppListController) Get() {
	namespace := ENV_KUBERNETES_NAMESPACE
	c.Data["namespace"] = namespace
	c.TplName = "create_app_list.tpl"
}

type CreateAppFormController struct {
	beego.Controller
}

func (c *CreateAppFormController) Get() {	
	fmt.Printf("CreateAppFormController , %s , %s \n", c.GetString("apptype"), c.GetString("dockerimage"))
	c.Data["apptype"] = c.GetString("apptype")
	c.Data["dockerimage"] = c.GetString("dockerimage")
	c.TplName = "create_app_form.tpl"
}



type ViewAppController struct {
	beego.Controller
}


func (c *ViewAppController) Get() {	

	namespace := ENV_KUBERNETES_NAMESPACE
	appname := c.GetString("appname")
	fmt.Printf("ViewAppController , %s  \n", appname)
	fmt.Printf("ViewAppController , %s  \n", labels.NewSelector().String())
	
	//TBD selector,_ := labels.Parse("app=" + appname) 
	
	listOptions := v1.ListOptions {
	//TBD	LabelSelector: selector,
	}
	
	kubernetesClient := getKubernetesClient()
	
	pods, err := kubernetesClient.Core().Pods(namespace).List(listOptions)
	if err != nil {
		panic(err.Error())
	}

	service, err := getKubernetesClient().Core().Services(namespace).Get(appname)
	if err != nil {
		panic(err.Error())
	} 
	
	c.Data["service"] = service 
	
	if(service.Status.LoadBalancer.Size() > 0){	
		c.Data["serviceurl"] = "http://" + service.Status.LoadBalancer.Ingress[0].IP + ":80"
	}  else {
		c.Data["serviceurl"] = "Processing.. Referesh Page"
	}
	
	c.Data["namespace"] = namespace
	c.Data["appname"] = c.GetString("appname")
	c.Data["podlist"] = pods.Items
	c.Data["Response"] = pods

	c.TplName = "view_app.tpl"
}


type DeleteAppController struct {
	beego.Controller
}

func getDeleteOptions() *v1.DeleteOptions {
	r := new(v1.DeleteOptions)
	return r
}

func (c *DeleteAppController) Get() {
	fmt.Printf("DeleteAppController Get\n")
	
//	appname := c.GetString("appname")
//	kubernetesClient := getKubernetesClient()
//	
//
//	selector,_ := labels.Parse("app=" + appname) 
//	
//	listOptions := api.ListOptions {
//		LabelSelector: selector,
//	}
//	
//	pods, err := kubernetesClient.Core().Pods(ENV_KUBERNETES_NAMESPACE).List(listOptions)
//	if err != nil {
//		panic(err.Error())
//	}
//	
//	for _,pod := range pods.Items {
//	  kubernetesClient.Pods(ENV_KUBERNETES_NAMESPACE).Delete(pod.Name, getDeleteOptions())
//	}
//		
//	kubernetesClient.Deployments(ENV_KUBERNETES_NAMESPACE).Delete(appname,getDeleteOptions())
//	kubernetesClient.Services(ENV_KUBERNETES_NAMESPACE).Delete(appname,getDeleteOptions())
	
	c.Redirect("/applications", 302)
}



type operation interface {
	Do(c *kubernetes.Clientset)
}

type deployOperation struct {
	image string
	name  string
	port  int
}

func (op *deployOperation) Do(c *kubernetes.Clientset) {
	if err := op.doDeployment(c); err != nil {
		log.Fatal(err)
	}

	if err := op.doService(c); err != nil {
		log.Fatal(err)
	}
}

func (op *deployOperation) doDeployment(c *kubernetes.Clientset) error {

	namespace := ENV_KUBERNETES_NAMESPACE
	appName := op.name

	// Define Deployments spec.
	deploySpec := &v1beta1.Deployment{
		TypeMeta: unversioned.TypeMeta{
			Kind:       "Deployment",
			APIVersion: "extensions/v1beta1",
		},
		ObjectMeta: v1.ObjectMeta{
			Name: op.name,
		},
		Spec: v1beta1.DeploymentSpec{
			Replicas: int32p(3),
			RevisionHistoryLimit: int32p(10),
			Template: v1.PodTemplateSpec{
				ObjectMeta: v1.ObjectMeta{
					Name:   op.name,
					Labels: map[string]string{"app": appName},
				},
				Spec: v1.PodSpec{
					Containers: []v1.Container{
						v1.Container{
							Name:  op.name,
							Image: op.image,
							Ports: []v1.ContainerPort{
								v1.ContainerPort{ContainerPort: int32(op.port), Protocol: v1.ProtocolTCP},
							},
							ImagePullPolicy: v1.PullIfNotPresent,
						},
					},
					RestartPolicy: v1.RestartPolicyAlways,
					DNSPolicy:     v1.DNSClusterFirst,
				},
			},
		},
	}

	// Implement deployment update-or-create semantics.
	deploy := c.Extensions().Deployments(namespace)
	_, err := deploy.Update(deploySpec)
	switch {
	case err == nil:
		fmt.Println("deployment controller updated")
	case !errors.IsNotFound(err):
		return fmt.Errorf("could not update deployment controller: %s", err)
	default:
		_, err = deploy.Create(deploySpec)
		if err != nil {
			return fmt.Errorf("could not create deployment controller: %s", err)
		}
		fmt.Println("deployment controller created")
	}

	return nil
}

func (op *deployOperation) doService(c *kubernetes.Clientset) error {
	namespace := ENV_KUBERNETES_NAMESPACE
	appName := op.name

	// Define service spec.
	serviceSpec := &v1.Service{
		TypeMeta: unversioned.TypeMeta{
			Kind:       "Service",
			APIVersion: "v1",
		},
		ObjectMeta: v1.ObjectMeta{
			Name: appName,
			Labels: map[string]string{"app": appName},			
		},
		Spec: v1.ServiceSpec{
			Type:     v1.ServiceTypeLoadBalancer,
			Selector: map[string]string{"app": appName},			
			Ports: []v1.ServicePort{
				v1.ServicePort{
					Protocol: v1.ProtocolTCP,
					Port:     80,					
					TargetPort: intstr.IntOrString{
						Type:   intstr.Int,
						IntVal: int32(op.port),
					},
				},
			},
		},
	}

	// Implement service update-or-create semantics.
	service := c.Core().Services(namespace)
	svc, err := service.Get(appName)
	switch {
	case err == nil:
		serviceSpec.ObjectMeta.ResourceVersion = svc.ObjectMeta.ResourceVersion
		serviceSpec.Spec.ClusterIP = svc.Spec.ClusterIP
		_, err = service.Update(serviceSpec)
		if err != nil {
			return fmt.Errorf("failed to update service: %s", err)
		}
		fmt.Println("service updated")
	case errors.IsNotFound(err):
		_, err = service.Create(serviceSpec)
		if err != nil {
			return fmt.Errorf("failed to create service: %s", err)
		}
		fmt.Println("service created")
	default:
		return fmt.Errorf("unexpected error: %s", err)
	}

	return nil
}

func int32p(i int32) *int32 {
	r := new(int32)
	*r = i
	return r
}
