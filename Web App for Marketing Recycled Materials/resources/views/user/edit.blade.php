	@extends('layouts.app')

	@section('content')
		<div class="container-fluid">
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
					<form action="{{ route('user.update', $user->id() ) }}" method="post">
						@csrf
						@method('PUT')

						<div class="box-body">
							<div class="form-group">
								<label >Name</label>
								<input type="text" class="form-control" name="name" value="{{ $user['displayName']}}"
									required="required" placeholder="Enter Name"/>
							</div>              
							<div class="form-group">
								<label >Email address</label>
								<input type="email" class="form-control" name="email" required="required" placeholder="Enter email" value="{{ $user['email'] }}">
							</div>
							<div class="form-group">
								<label >Category</label>
								<input type="text" class="form-control" name="category" 
									placeholder="Category" value="{{ $user['userCategory']}}">
							</div>
						</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-success">SUBMIT</button>
						<a href="{{url('/user')}}" class="btn btn-danger">CANCEL</a>
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
		</div>
	@endsection            