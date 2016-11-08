package routers

import (
	"vishnu/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.ViewClusterController{})
    beego.Router("/blank", &controllers.BlankController{})
    beego.Router("/viewcluster", &controllers.ViewClusterController{})
}
