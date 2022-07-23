	@extends('layouts.app')

	@section('content')
		<div class="container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="col-md-6">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header with-border">
					<h3 class="box-title">Form Product</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form action="{{ route('product.update', $product->id() ) }}" method="post">
						@csrf
						@method('PUT')

						<div class="box-body">
							<div class="form-group">
								<label >Name :</label>
								<input type="text" class="form-control" name="name" value="{{ $product['name']}}"
									required="required" placeholder="Enter Name"/>
							</div>              
							<div class="form-group">
								<label >Popular Product:</label>
								<input type="text" class="form-control" name="isPopular" required="required" placeholder="true or false" value="{{ $product['isPopular'] }}">
							</div>
							<div class="form-group">
								<label >Recommended Product:</label>
								<input type="text" class="form-control" name="isRecommended" required="required" placeholder="true or false" value="{{ $product['isRecommended'] }}">
							</div>
							<div class="form-group">
								<label >product Number :</label>
								<input type="text" class="form-control" name="id" 
									placeholder="id" value="{{ $product['id']}}">
							</div>
						</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-success">SUBMIT</button>
						<a href="{{url('/product')}}" class="btn btn-danger">CANCEL</a>
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