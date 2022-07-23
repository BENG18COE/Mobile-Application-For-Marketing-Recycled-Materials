@extends('layouts.app')
@section('content')
<section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Form User</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="/products/store" method="post">
            {{ csrf_field() }}
              <div class="box-body">
              <div class="form-group">
                  <label for="exampleInputEmail1">Name</label>
                  <input type="text" class="form-control" name="nama" required="required" placeholder="Enter Nama">
                </div>              
                <div class="form-group">
                  <label for="exampleInputEmail1">isPopular</label>
                  <input type="email" class="form-control" name="email" required="required" placeholder="true or false">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">isRecommended</label>
                  <input type="email" class="form-control" name="email" required="required" placeholder="true or false">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">id</label>
                  <input type="email" class="form-control" name="email" required="required" placeholder="next int">
                </div>
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
        </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
@endsection            