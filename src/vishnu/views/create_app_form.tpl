{{ template "layout.tpl" . }}


{{ define "content" }}
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create a {{ .apptype }} App</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

           <div class="row">
                <div class="col-lg-4">
					<form role="form" action="/createapp" method="get">
                        <div class="form-group">
                            <label>Name of your app</label>
                            <input class="form-control" name="appname">
                            <p class="help-block">Name of your application</p>
                        </div>
                        <div class="form-group">
                            <label>Docker Image</label>
                            <input class="form-control" value="{{ .dockerimage }}" name="dockerimage">
                            <p class="help-block">Docker image used to build your app</p>
                        </div>
                        <div class="form-group">
                            <label>Port</label>
                            <input class="form-control" name="appport" value="80" enabled=false>                       
                        </div>
                        <input type="hidden" name="apptype" value="{{ .apptype }}">
                        <button type="submit" class="btn btn-primary">Create App</button>
                        <button type="reset" class="btn btn-default">Reset Button</button>
                    </form>
		        
                </div>
            </div>
{{ end }}

