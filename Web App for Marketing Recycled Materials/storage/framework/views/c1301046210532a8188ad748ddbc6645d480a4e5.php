<?php $__env->startSection('content'); ?>
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">User Management</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">USer management</li>
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
						<th style="width: 1%">
							#
						</th>
						<th style="width: 20%">
							User name
						</th>
						<th style="width: 30%">
							User email
						</th>
						<th style="width: 30%">
							User Category
						</th>
						
						<th style="width: 20%">
							Actions
						</th>
					</tr>
				</thead>
				<tbody>
						<?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
							<tr>
								<td><?php echo e($user->id()); ?></td>
								<td><?php echo e($user['displayName']); ?></td>
								<td><?php echo e($user['email']); ?></td>
								<td><?php echo e($user['userCategory']); ?></td>
								<td>
									<a class="btn btn-info btn-sm" href="<?php echo e(url('/user/'.$user->id() )); ?>">
										<i class="fas fa-pencil-alt">
										</i>
										Edit
									</a>
									<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal-danger-<?php echo e($user->id()); ?>">
										<i class="fas fa-trash"></i>
										Delete
									</button>

									<div class="modal fade" id="modal-danger-<?php echo e($user->id()); ?>">
										<div class="modal-dialog">
										<div class="modal-content bg-danger">
											<div class="modal-header">
											<h4 class="modal-title">Delete <?php echo e($user['displayName']); ?> <br /><?php echo e($user->id()); ?></h4>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											</div>
											<div class="modal-footer justify-content-between">
											<button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
											<form action="<?php echo e(route('user.delete', $user->id())); ?>" method="post" id="form-delete<?php echo e($user->id()); ?>">
												<?php echo method_field('DELETE'); ?>
												<?php echo csrf_field(); ?>
											</form>
											<button type="button" 
												class="btn btn-outline-light" 
												onclick="document.getElementById('form-delete<?php echo e($user->id()); ?>').submit();"
												>DELETE</button>
											</div>
										</div>
										<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
								</td>
								
							</tr>

						<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
				</tbody>
			</table>
			</div>
			<!-- /.card-body -->
		</div>
			<!-- /.row -->

		</div><!--/. container-fluid -->
	</section>
	<!-- /.content -->
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\Trijay\Desktop\Projects\example-app\resources\views/user/index.blade.php ENDPATH**/ ?>