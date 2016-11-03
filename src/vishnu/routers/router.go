package routers

import (
	"vishnu/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/blank", &controllers.BlankController{})
}
