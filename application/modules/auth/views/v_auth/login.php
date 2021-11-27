		<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post" action="<?= base_url('login') ?>">

					<span class="login100-form-title p-b-26 text-primary">
						E-Raport
					</span>
					<span class="login10-form-title p-b-14 text-primary">
					<center>SD Negeri Purwantoro 2 Malang</center>
					</span>
					<span class="login100-form-title p-b-48">
					<br>
						<img src="<?= base_url() ?>asset/img/logo/logo1.png" width="100">
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Email valid : a@b.c">
						<input class="input100" type="text" name="email">
						<span class="focus-input100" data-placeholder="Email"></span>
						<?= form_error('email','<small class="text-danger">','</small>') ?>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Masukan password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
						<?= form_error('password','<small class="text-danger">','</small>') ?>
					</div>
					<?= get_csrf(); ?>
					<div class="">
						<button class="btn btn-primary col-lg" type="submit">LOGIN</button>
					</div>

					<div class="text-center p-t-15">
						<span class="txt1">
							Apakah anda siswa ?
						</span>

						<a class="txt2" href="<?= base_url('register') ?>">
							Registrasi
						</a>
						<br>
						<!-- <a class="txt2" href="<?= base_url('forgot-password') ?>">
							Lupa Password ?
						</a> -->
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
