package controllers

import (
	"fmt"
	"os"
	"github.com/astaxie/beego"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/pkg/api/v1"
	"k8s.io/client-go/rest"
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


type ViewClusterController struct {
	beego.Controller
}


func (c *ViewClusterController) Get() {	
	fmt.Printf("ViewClusterController \n")
	
	
	kubernetesClient := getKubernetesClient()
	
	pods, err := kubernetesClient.Core().Pods(ENV_KUBERNETES_NAMESPACE).List(v1.ListOptions{})
	if err != nil {
		panic(err.Error())
	}

	services, err := kubernetesClient.Core().Services(ENV_KUBERNETES_NAMESPACE).List(v1.ListOptions{})
	if err != nil {
		panic(err.Error())
	} 
	
	c.Data["namespace"] = ENV_KUBERNETES_NAMESPACE

	c.Data["services"] = services
	c.Data["servicelist"] = services.Items
	
	c.Data["pods"] = pods
	c.Data["podlist"] = pods.Items

	c.TplName = "view_cluster.tpl"
}

