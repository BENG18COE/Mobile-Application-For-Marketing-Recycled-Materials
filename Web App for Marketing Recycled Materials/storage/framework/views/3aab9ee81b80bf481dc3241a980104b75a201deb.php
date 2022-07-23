	

	<?php $__env->startSection('content'); ?>
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
					<form action="<?php echo e(route('user.update', $user->id() )); ?>" method="post">
						<?php echo csrf_field(); ?>
						<?php echo method_field('PUT'); ?>

						<div class="box-body">
							<div class="form-group">
								<label >Name</label>
								<input type="text" class="form-control" name="name" value="<?php echo e($user['displayName']); ?>"
									required="required" placeholder="Enter Name"/>
							</div>              
							<div class="form-group">
								<label >Email address</label>
								<input type="email" class="form-control" name="email" required="required" placeholder="Enter email" value="<?php echo e($user['email']); ?>">
							</div>
							<div class="form-group">
								<label >Category</label>
								<input type="text" class="form-control" name="category" 
									placeholder="Category" value="<?php echo e($user['userCategory']); ?>">
							</div>
						</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-success">SUBMIT</button>
						<a href="<?php echo e(url('/user')); ?>" class="btn btn-danger">CANCEL</a>
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
	<?php $__env->stopSection(); ?>            
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\Trijay\Desktop\Projects\example-app\resources\views/user/edit.blade.php ENDPATH**/ ?>