package main

import "fmt"
import "time"

func main() {
	
	for i := 0; i < 600 ; i++ {		
	    fmt.Println("hello world ", i)
	    time.Sleep(time.Second)
	}
}