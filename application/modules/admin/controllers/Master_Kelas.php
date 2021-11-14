<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Master_Kelas extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		//load model
		$this->load->model('M_Admin');
		$this->load->model('M_Master_Kelas');
		$this->load->model('M_Tools_Admin');
		//load helper
		$this->load->helper('admin');
		//mengecek apakah dia melakukan login , dan apa levelnya nya , lalu ditempatkan sesuai hak aksesnya
		$this->load->helper('access');
		check_access();
		//data user yang login
		$this->user_login_data = $this->M_Admin->get_user_login_data();
	}

	public function index()
	{
		$data['title']					= 'Kelas';
		$data['user_login_data'] 		= $this->user_login_data;
		$data['count_unread_pesan']		= $this->M_Admin->get_all_unread_pesan("count");
		$data['all_unread_pesan'] 		= $this->M_Admin->get_all_unread_pesan();
		$data['all_kelas'] 				= $this->M_Master_Kelas->get_kelas()->result_array();
		$data['all_kategori_kelas']  	= $this->M_Master_Kelas->get_kategori_kelas()->result_array();
		########### ============= ##############
		$this->load->view('layouts/header',$data);
		$this->load->view('layouts/navbar',$data);
		$this->load->view('layouts/sidebar',$data);
		$this->load->view('v_master/master_kelas',$data);
		$this->load->view('layouts/footer');
	}

	public function add_kelas()
	{
		$img_kelas = $this->M_Tools_Admin->upload_img('kelas');
		$this->M_Tools_Admin->resize_image('kelas/'.$img_kelas,'165','165');
		$data = [
			'nama_kelas' 			=> htmlentities($this->input->post('nama_kelas',TRUE)),
			'nama_lain_kelas' 	=> htmlentities($this->input->post('nama_lain_kelas',TRUE)),
			'deskripsi_kelas' 	=> htmlentities($this->input->post('deskripsi_kelas',TRUE)),
			'img_kelas' 			=> 		$img_kelas,
			'kategori_kelas_id' 	=> $this->input->post('kategori_kelas_id')
		];
		$this->M_Master_Kelas->create($data);
		$this->session->set_flashdata('success','Data berhasil ditambah');
		redirect('admin/master-kelas');
	}

	public function show_kelas($id)
	{
	 	$data = $this->M_Master_Kelas->get_kelas($id)->row_array();
	 	echo json_encode($data);
	}

	public function update_kelas()
	{
		if (!empty($_FILES['file']['name'])) {
			$img_kelas = $this->M_Tools_Admin->upload_img('kelas');
			$this->M_Tools_Admin->resize_image('kelas/'.$img_kelas,'165','165');
			unlink(FCPATH.'./asset/img/kelas/'.$this->input->post('oldimage'));
		}else{
			$img_kelas = $this->input->post('oldimage');
		}
		$data = [
			'nama_kelas' 			=> $this->input->post('nama_kelas'),
			'nama_lain_kelas' 	=> $this->input->post('nama_lain_kelas'),
			'deskripsi_kelas' 	=> $this->input->post('deskripsi_kelas'),
			'img_kelas'			=> $img_kelas,
			'kategori_kelas_id'	=> $this->input->post('kategori_kelas_id')
		];
		$id_kelas = $this->input->post('id_kelas');
		$this->M_Master_Kelas->update($id_kelas,$data);
		$this->session->set_flashdata('success','Data berhasil diubah');
		redirect('admin/master-kelas');
	}

	public function delete_kelas($id)
	{
		//get image rows from this kelas data, then delete image from directory
		$kelas = $this->M_Master_Kelas->get_kelas($id)->row_array();
		unlink(FCPATH.'./asset/img/kelas/'.$kelas['img_kelas']);
		//
		$this->M_Master_Kelas->delete($id);
		$this->session->set_flashdata('success','Data berhasil dihapus');
		redirect('admin/master-kelas');
	}

	public function clear_kelas()
	{
		$get_kelas = $this->M_Master_Kelas->get_kelas()->result_array();
		foreach ($get_kelas as $kelas) {
			unlink("./asset/img/kelas/".$kelas['img_kelas']);
		}
		$this->db->empty_table('tbl_kelas');
		$this->session->set_flashdata('success','Data berhasil dikosongkan');
		redirect('admin/master-kelas');
	}

	################# ################# ################### ################### #####################
	#									   KATEGORI kelas											#
	################# ################# ################### ################### #####################
	public function add_kategori_kelas()
	{
		$this->M_Master_Kelas->add_kategori();
		$this->session->set_flashdata('success', 'data berhasil ditambah');
		redirect('admin/master-kelas');
	}

	public function show_kategori_kelas($id)
	{
	 	$data = $this->M_Master_Kelas->get_kategori_kelas($id)->row_array();
	 	echo json_encode($data);
	}

	public function update_kategori_kelas()
	{
	 	$id_kategori_kelas=$this->input->post('id_kategori_kelas');
		$data = [
			'nama_kategori_kelas' => htmlentities($this->input->post('nama_kategori'))
		];
		$this->db->where('id_kategori_kelas',$id_kategori_kelas);
		$this->db->update('tbl_kategori_kelas',$data);
		$this->session->set_flashdata('success','Data berhasil diubah');
		redirect('admin/master-kelas');
	}

	public function delete_kategori_kelas($id)
	{
		$this->M_Master_Kelas->delete_kategori($id);
		$this->session->set_flashdata('success', 'data berhasil dihapus');
		redirect('admin/master-kelas');
	}

	public function clear_kategori_kelas()
	{
		$this->M_Master_Kelas->clear_kategori();
		$this->session->set_flashdata('success', 'data berhasil dikosongkan');
		redirect('admin/master-kelas');
	}
	################# ################# ################### ################### #####################
	#									   KATEGORI kelas											#
	################# ################# ################### ################### #####################

}

/* End of file Master_Kelas.php */
/* Location: ./application/modules/admin/controllers/Master_Kelas.php */