{{ template "layout.tpl" . }}


{{ define "content" }}
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">View App {{ .appname }}</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

           <div class="row">
	            <div class="col-lg-12">            
			        <h1 class="page-header">Pods</h1>
			        <div class="table-responsive">
			            <table class="table table-striped">
			              <thead>
			                <tr>
			                  <th>#</th>
			                  <th>Pod Name</th>
			                </tr>
			              </thead>
			              <tbody>                
						 	{{range $key, $val := .podlist}}
						 	<tr>
						 		<td>{{$key}}</td>
						 		<td>{{$val.Name}}</td>
						    </tr>
						    {{end}}               
			                     
			              </tbody>
			            </table>
			        </div>
	            </div>
           </div>
 
 	        <h1 class="page-header"> Service </h1>
	        <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>Services Name</th>
	                  <th>Action</th>
	                </tr>
	              </thead>
	              <tbody>                
				 	<tr>
				 		<td>{{ .service.Name}}</td>
				 		<td><a href="{{ .serviceurl}}"> {{ .serviceurl}} </a></td>
				    </tr>	                     
	              </tbody>
	            </table>
	        </div>
           
           
           <div class="row">
              <div class="col-lg-12">
				<button class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                    Delete App
                </button>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Are you sure you want to delete the app?</h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <a href="/deleteapp?appname={{.appname}}" class="btn btn-danger">Yes delete app</a>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
           		
           		
           		
           	  </div>
		   </div>


            
           <!--div class="row">
	            <div class="col-lg-12">            
		            <h1 class="page-header"> Response </h1>
		        	<div class="well"> <p> {{ .Response }} </p> </div>
	            </div>
           </div-->
        
{{ end }}

