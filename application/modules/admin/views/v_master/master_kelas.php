  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><?= $title; ?></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<?= base_url('admin') ?>">Home</a></li>
              <li class="breadcrumb-item active"><?= $title; ?></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">

        <div class="card">
            <div class="card-header">
              <h3 class="card-title"><?= $title; ?></h3>
              <div class="float-right">
                <button class="btn btn-primary" data-toggle="modal" data-target="#modal-tambah"><i class="fas fa-fw fa-plus"></i> Tambah Data</button>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row">
                <div class="col-md-5 float-right">
              </div>
              </div>
              <div class="table-responsive">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Img</th>
                  <th>Kelas</th>
                  <th>Alias</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>

                  <?php $no=1; foreach ($all_kelas as $jr): ?>
                    <tr>
                  <th><?= $no++ ?></th>
                  <td><?= $jr['img_kelas'] ?></td>
                  <td><?= $jr['nama_lain_kelas'] ?></td>
                  <td><?= $jr['nama_kelas'] ?></td>
                  <td>
                    <button id="<?= $jr['id_kelas'] ?>" class="btn btn-primary btn-edit"><i class="fas fa-fw fa-edit"></i></button>
                    <a href="<?= base_url('admin/Master_Kelas/delete_kelas/').$jr['id_kelas'] ?>" class="btn btn-danger btn-hapus" onclick="return confirm('Yakin ?')"><i class="fas fa-fw fa-ban"></i></a>
                  </td>
                </tr>

                  <?php endforeach; ?>

                </tbody>
              </table>
              </div>
              <a onclick="return confirm('Yakin ?')" href="<?= base_url('admin/Master_Kelas/clear_kelas/') ?>" class="btn btn-danger">Kosongkan Data</a>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->


          <!-- Tabel kategori kelas -->
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Tahun Ajaran <?= $title; ?></h3>
              <div class="float-right">
                <button class="btn btn-primary" data-toggle="modal" data-target="#modal-tambah-kategori-file"><i class="fas fa-fw fa-plus"></i> Tambah Data</button>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Tahun Ajaran</th>
                  <th>Aksi</th>
                </tr>
                </thead>
                <tbody>
                  <?php $no=1; foreach ($all_kategori_kelas as $kategori): ?>
                <tr>
                  <td><?= $no++ ?></td>
                  <td><?= $kategori['nama_kategori_kelas'] ?></td>
                  <td>
                    <button id="<?= $kategori['id_kategori_kelas'] ?>" class="btn btn-primary btn-edit-kategori-kelas"><i class="fas fa-fw fa-edit"></i>
                    </button>
                    <a  onclick="return confirm('Yakin ?')" href="<?= base_url('admin/Master_Kelas/delete_kategori_kelas/').$kategori['id_kategori_kelas']; ?>" class="btn btn-danger"><i class="fas fa-fw fa-trash"></i>
                    </a>
                  </td>
                </tr>
                  <?php endforeach; ?>
                </tbody>
              </table>
              <a onclick="return confirm('Yakin ?')" href="<?= base_url('admin/Master_Kelas/clear_kategori_kelas') ?>" class="btn btn-danger">Kosongkan Data</a>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->



<!-- ###################################  MODAL kelas   ################################ -->

<!-- Tambah Data kelas Modal -->
<div class="modal fade" id="modal-tambah" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tambah data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" enctype="multipart/form-data" action="<?= base_url('admin/Master_Kelas/add_kelas') ?>">
      <div class="modal-body">
        <div class="form-group">
          <input type="text" required="" name="nama_kelas" placeholder="Nama kelas" class="form-control"></input>
        </div>
        <div class="form-group">
          <input required="" name="nama_lain_kelas" type="text" placeholder="Alias" class="form-control"></input>
        </div>

        <?php
        $get_kategori_kelas = $this->db->get('tbl_kategori_kelas')->result_array();
         ?>
        <div class="form-group">
          <label for="role_id">Kategori kelas</label>
          <select name="kategori_kelas_id" class="form-control">
            <?php foreach ($get_kategori_kelas as $kategori_jr): ?>
              <option value="<?= $kategori_jr['id_kategori_kelas'] ?>"><?= $kategori_jr['nama_kategori_kelas'] ?></option>
            <?php endforeach; ?>
          </select>
        </div>

        <div class="form-group">
          <textarea class="form-control" required="" placeholder="Deskripsi kelas" name="deskripsi_kelas"></textarea>
        </div>

        <div class="form-group">
          <label>Gambar kelas</label>
          <div class="custom-file">
            <input type="file" name="file" class="custom-file-input" id="customFile">
            <label class="custom-file-label" for="customFile">Choose file</label>
          </div>
        </div>

      </div>
      <?= get_csrf() ?>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
      </form>
      </div>
    </div>
  </div>
</div>


<!-- Edit Data kelas Modal -->
<div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" enctype="multipart/form-data" action="<?= base_url('admin/Master_Kelas/update_kelas') ?>">
      <div class="modal-body">
        <div class="form-group">
          <input required="" id="id_kelas" name="id_kelas" type="hidden" readonly class="form-control" placeholder="Nama kelas"></input>
        </div>
        <div class="form-group">
          <input required="" id="nama_kelas" name="nama_kelas" type="text" class="form-control" placeholder="Nama kelas"></input>
        </div>
        <div class="form-group">
          <input required="" id="nama_lain_kelas" name="nama_lain_kelas" placeholder="Alias" class="form-control"></input>
          <small id="emailHelp" class="form-text text-muted">contoh : TKR</small>
        </div>
        <div class="form-group">
          <textarea required="" id="deskripsi_kelas" name="deskripsi_kelas" type="text" placeholder="Deskripsi kelas" class="form-control"></textarea>
        </div>

        <div class="form-group">
          <label for="role_id">Kategori kelas</label>
          <select name="kategori_kelas_id" class="form-control">
            <?php foreach ($get_kategori_kelas as $kategori_jr): ?>
              <option value="<?= $kategori_jr['id_kategori_kelas'] ?>"><?= $kategori_jr['nama_kategori_kelas'] ?></option>
            <?php endforeach; ?>
          </select>
        </div>

        <input type="hidden" id="oldimage" name="oldimage">
        <div class="form-group">
          <label>Gambar kelas</label>
          <div class="custom-file">
            <input type="file" name="file" class="custom-file-input" id="customFile">
            <label class="custom-file-label" for="customFile">Choose file</label>
            <small id="emailHelp" class="form-text text-muted">Masukan gambar jika ingin merubah gambar</small>
          </div>
        </div>
      </div>
      <?= get_csrf() ?>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Update</button>
      </form>
      </div>
    </div>
  </div>
</div>
<!-- ##################################  MODAL kelas   ################################ -->


<!-- ###################################  MODAL KATEGORI kelas   ################################ -->

<!-- Tambah Data KATEGORI kelas Modal -->
<div class="modal fade" id="modal-tambah-kategori-file" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tambah data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="<?= base_url('admin/Master_Kelas/add_kategori_kelas') ?>">

        <div class="form-group">
          <label>Nama Kategori</label>
          <input required="" name="nama_kategori" placeholder="Nama Kategori" class="form-control"></input>
        </div>

      </div>
      <?= get_csrf() ?>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
      </form>
      </div>
    </div>
  </div>
</div>



<!-- Edit Data KATEGORI kelas Modal -->
<div class="modal fade" id="modal-edit-kategori-kelas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tambah data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="<?= base_url('admin/Master_Kelas/update_kategori_kelas') ?>">

          <input required="" type="hidden" name="id_kategori_kelas" id="id_kategori_kelas" placeholder="" class="form-control"></input>

        <div class="form-group">
          <label>Nama Kategori</label>
          <input required="" name="nama_kategori" id="nama_kategori" placeholder="Nama Kategori" class="form-control"></input>
        </div>

      </div>
      <?= get_csrf() ?>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
      </form>
      </div>
    </div>
  </div>
</div>


<!-- ###################################  MODAL KATEGORI kelas   ################################ -->


<script type="text/javascript">
  $(document).ready(function() {
    $(".btn-edit").click(function(){
      let id_kelas = $(this).attr("id")
      $.get("<?= base_url('admin/Master_Kelas/show_kelas/') ?>"+id_kelas,function(response){
        let result = JSON.parse(response)
        $("#modal-edit").modal("show")
        console.log(result)
        $("#id_kelas").val(result.id_kelas)
        $("#nama_kelas").val(result.nama_kelas)
        $("#nama_lain_kelas").val(result.nama_lain_kelas)
        $("#deskripsi_kelas").val(result.deskripsi_kelas)
        $("#oldimage").val(result.img_kelas)
      })
    })

    $(".btn-edit-kategori-kelas").click(function(){
      let id_kategori_kelas = $(this).attr("id")
      $.get("<?= base_url('admin/Master_Kelas/show_kategori_kelas/') ?>"+id_kategori_kelas,function(response){
        let result = JSON.parse(response)
        $("#modal-edit-kategori-kelas").modal("show")
        console.log(result)
        $("#id_kategori_kelas").val(result.id_kategori_kelas)
        $("#nama_kategori").val(result.nama_kategori_kelas)
      })
    })

  })
</script>