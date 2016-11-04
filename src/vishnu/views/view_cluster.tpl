{{ template "layout.tpl" . }}


{{ define "content" }}
        <h1 class="page-header">Namespace : {{ .namespace }}</h1>
        
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
        
        
        <h1 class="page-header"> Services </h1>
        <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Services Name</th>
                </tr>
              </thead>
              <tbody>                
			 	{{range $key, $val := .servicelist}}
			 	<tr>
			 		<td>{{$key}}</td>
			 		<td>{{$val.Name}}</td>
			    </tr>
			    {{end}}               
                     
              </tbody>
            </table>
        </div>
        

{{ end }}

