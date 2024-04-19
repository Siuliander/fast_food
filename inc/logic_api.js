
const md5 = require('md5')
const rand = require('randomstring')

const logic_api =
{

	help: () => 
	{
		const ajuda = {
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
		};
		
		return ajuda;
	},

    status: () =>
    {
        return {
            'status' : 'SUCCESS',
            'message' : 'API is running ok!',
            'results' : null
        };
    },


}

module.exports = logic_api
//module.exports = get_md5
