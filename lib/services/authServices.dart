import { axiosRequest } from './axiosServices';

const login = (email, password, success, fail) => {
	const route = 'ba/login';
	const params = {
		client_id: 2,
		client_secret: 'aKBmBHrotjlxBAFA9hRGyr1wjj3LKqobfX98uHRM',
		nric: email,
		ref_no: password
	};

	axiosRequest(route, params, 'POST', success, fail);
};

export {
	login
};
