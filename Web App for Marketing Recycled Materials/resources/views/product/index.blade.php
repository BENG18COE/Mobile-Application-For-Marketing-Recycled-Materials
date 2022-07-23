@extends('layouts.app')

@section('content')
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Product Management</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Product management</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<!-- Info boxes -->
			<div class="card">
			<div class="card-header">
			<h3 class="card-title">Products</h3>

			<div class="card-tools">
				<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
				<i class="fas fa-minus"></i>
				</button>
			</div>
			</div>
			<div class="card-body p-0">
						

			<table class="table table-striped projects">
				<thead>
					<tr>
						<th style="width: 10%">
							#
						</th>
						<th style="width: 10%">
							Product no
						</th>
						<th style="width: 20%">
							 product name
						</th>
						<th style="width: 20%">
							Popular product
						</th>
						<th style="width: 20%">
							Recommended product
						</th>
						
						<th style="width: 20%">
							Actions
						</th>
					</tr>
				</thead>
				<tbody>
						@foreach( $products as $product)
							 <tr>
								<td>{{ $product->id() }}</td>
								<td>{{ $product['id']}}</td> 
								<td>{{ $product['name']}}</td>
								<td align="center">{{ $product['isPopular'] == 1 ? "YES" : "NO" }}</td>
								<td>{{ $product['isRecommended'] == 1 ? "YES" : "NO"}}</td>
								<td>
									<a class="btn btn-info btn-sm" href="{{ url('/product/'.$product->id() )}}">
										<i class="fas fa-pencil-alt">
										</i>
										Edit
									</a>
									<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal-danger-{{$product->id()}}">
										<i class="fas fa-trash"></i>
										Delete
									</button>

									<div class="modal fade" id="modal-danger-{{$product->id()}}">
										<div class="modal-dialog">
											<div class="modal-content bg-danger">
												<div class="modal-header">
												<h4 class="modal-title">Delete {{$product['name']}} <br />{{$product->id()}}</h4>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												</div>
												<div class="modal-footer justify-content-between">
												<button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
												<form action="{{ route('product.delete', $product->id())}}" method="post" id="form-delete{{$product->id()}}">
													@method('DELETE')
													@csrf
												</form>
												<button type="button" 
													class="btn btn-outline-light" 
													onclick="document.getElementById('form-delete{{$product->id()}}').submit();"
													>DELETE</button>
												</div>
											</div>
										
										</div>
										
									</div>
								</td>
							
								
							</tr>

						@endforeach
				</tbody>
			</table>
			</div>
			<!-- /.card-body -->
		</div>
			<!-- /.row -->

		</div><!--/. container-fluid -->
	</section>
	<!-- /.content -->
@endsection
