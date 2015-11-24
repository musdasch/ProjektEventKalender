<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * [ Home_Controller ]
 * Index Page for this controller.
 *
 * Maps to the following URL:
 *  http://example.com/
 *  http://example.com/index.php/home
 *  http://example.com/index.php/home/index
 *
 * This controller is set as the default controller
 * in config/routes.php.
 *
 * @author Tim Voegtli tim.voegtli@gibmit.ch
 * @version 1.0 First version the index page controller.
 */
class Home extends CI_Controller {

	/**
	 * The index() function loads the home view
	 * from the application/views/home_view.php
	 */
	public function index()
	{
		$this->load->view('home_view');
	}
}