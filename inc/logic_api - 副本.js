const md5 = require('md5')
const rand = require('randomstring')
/*
// --------------------------------------------------
    // MD5 - ENCRIPTAÇÃO NO SISTEMA
    // --------------------------------------------------
   
	function  get_md5( let texto = null, let prefix = null, let suffix = null) 
	{
		if ( texto === null)
		{
			return prefix + md5( uniqid() + md5( rand.generate() ) ) + suffix;
		}
		return md5(texto) ;
	}
	

// --------------------------------------------------
// PASSWORD FUNCTION
// --------------------------------------------------

function get_id_passwd($passwd=null)
{
	$params = {
		':passwd' => $this->get_md5($passwd)
	};
	
	$db = new database();
	
	// check if there is already another password with the same: pwd
	$results = $db->EXE_QUERY("SELECT id_pwd FROM tb_pwd WHERE 1 AND pwd = :passwd LIMIT 1", $params);
	if(count($results) == 0){
		return [["id_pwd" => 0]][0]["id_pwd"];
	}
	
	return $results{0]["id_pwd"];
}

function create_new_passwd($passwd=null)
{
	// check if all data is available
	if(
		empty($passwd) ||
		($passwd === null)			
	) {
		return $this->error_response('Insufficient password data.');
	}
	
	$results = $this->get_id_passwd($passwd) ;
	
	if( $results != 0){
		return $results;
	}
	
	$db = new database();
	$params = {
		':passwd' => $this->get_md5($passwd)
	};
	
	$db->EXE_QUERY("
		INSERT INTO tb_pwd VALUES(
			0,
			:passwd
		)
	", $params);
	
	$results = $this->get_id_passwd($passwd) ;
	
	return $results;
}
*/

const logic_api =
{

    // --------------------------------------------------
    error_response: (message)  => 
    {
        // returns an error from the API
        return {
            'status' : 'ERROR',
            'message' : message,
            'results' : []
        };
    },

    
	// --------------------------------------------------
    // ENDPOINT HELP
    // --------------------------------------------------
   
	help: () => 
	{
		return [
		{
			'status' : 'SUCCESS',
			'message' : 'API help',
			'results' : {
				'endpoints' : [
					'help',
					'status',
					'get_clients',
					'create_new_client',
					'',
				],
			},
		}];
	},

    // --------------------------------------------------
    // ENDPOINTS OU ROTAS
    // --------------------------------------------------
    status: () =>
    {
        return {
            'status' : 'SUCCESS',
            'message' : 'API is running ok!',
            'results' : null
        };
    },



   // --------------------------------------------------
    // CLIENTES - CRIAR, EDITAR, DELETAR, VER 
    // --------------------------------------------------
    
	create_new_client: () => {


        return {
            'status' : 'SUCCESS',
            'message' : 'New client added with success.',
            'results' : []
        };
    },
    
    get_clients: () => 
    {
        // returns of all data from a certain client
        let sql = "SELECT * FROM tb_cliente WHERE 1 ";

        let results = {
            'status' : 'SUCCESS',
            'message' : '',
            'results' : ''
        };

        return {
            'status' : 'SUCCESS',
            'message' : '',
            'results' : results
        };
    },

    // --------------------------------------------------
	
}

module.exports = logic_api
//module.exports = get_md5
