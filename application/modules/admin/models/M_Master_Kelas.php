<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class M_Master_Kelas extends CI_Model {

	public function create($data=[])
	{
		return $this->db->insert("tbl_kelas",$data);
	}

	public function get_kelas($id=NULL)
	{
		if ($id) {
			return $this->db->get_where("tbl_kelas",["id_kelas" => $id]);
		}else{
			return $this->db->get('tbl_kelas');
		}
	}

	public function update($id,$data=[])
	{
		$this->db->where("id_kelas",$id);
		return $this->db->update("tbl_kelas",$data);
	}

	public function delete($id=NULL)
	{
		return $this->db->delete("tbl_kelas",["id_kelas" => $id]);
	}

	################# ################# ################### ################### #####################
	#									   KATEGORI FILE											#
	################# ################# ################### ################### #####################
	public function get_kategori_kelas($id=NULL)
	{
		if ($id) {
			return $this->db->get_where("tbl_kategori_kelas",["id_kategori_kelas" => $id]);
		}else{
			return $this->db->get("tbl_kategori_kelas");
		}
	}

	public function add_kategori()
	{
		$data_kategori = [
			'nama_kategori_kelas' => $this->input->post('nama_kategori')
		];
		$this->db->insert("tbl_kategori_kelas",$data_kategori);
	}

	public function delete_kategori($id)
	{
		$this->db->delete('tbl_kategori_kelas',['id_kategori_kelas' => $id]);
	}

	public function clear_kategori()
	{
		$this->db->empty_table("tbl_kategori_kelas");
	}
	################# ################# ################### ################### #####################
	#									   KATEGORI FILE											#
	################# ################# ################### ################### #####################

}

/* End of file M_Master_kelas.php */
/* Location: ./application/modules/admin/models/M_Master_kelas.php */