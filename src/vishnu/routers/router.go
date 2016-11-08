package routers

import (
	"vishnu/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.ViewClusterController{})
    beego.Router("/blank", &controllers.BlankController{})
    beego.Router("/viewcluster", &controllers.ViewClusterController{})
    
    beego.Router("/createapplist", &controllers.CreateAppListController{})
    beego.Router("/createappform", &controllers.CreateAppFormController{})
    beego.Router("/createapp", &controllers.CreateAppController{})
    beego.Router("/viewapp", &controllers.ViewAppController{})
	beego.Router("/deleteapp", &controllers.DeleteAppController{})
}
