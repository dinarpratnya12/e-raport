<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Pagenotfound extends CI_Controller {

	public function index()
	{	
		$this->load->view('pagenotfound/index');
	}

	public function search_page()
	{
		redirect($this->input->post('page'));
	}

}

/* End of file Pagenotfound.php */
/* Location: ./application/controllers/Pagenotfound.php */