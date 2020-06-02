import Vue from 'vue';
import Vuex from 'vuex';
import { routes } from './routes';

Vue.use(Vuex);

export default new Vuex.Store({
    state:{
        token:null,
        user:null,
        current: 'latest'
    },
    getters:{
        authenticated(state){
            return state.token && state.user
        },
        user(state){
            return state.user
        },
    },
    mutations: {
        set_token(state,token){
            state.token = token;
        },
        set_user(state,user){
            state.user = user
        }
    },
    actions:{

        async attempt({dispatch,commit},credentials)
        {

            let response = await axios.post('api/auth/login',{
                username: credentials.username,
                password: credentials.password
            });

            return dispatch('get_user',response.data.access_token);

        },
        async get_user({commit,state},token)
        {
            
            if(token)
            {
                commit('set_token',token);
            }

            if(!state.token)
            {
                return;
            }


            await axios({
                method: 'post',
                url: 'api/auth/me',
                headers: {
                    'Authorization': 'Bearer '+token
                }
            })
            .then(response => {
                commit('set_user', response.data);
            })
            .catch(()=>{
                commit('set_token',null);
                commit('set_user',null);
            });

        },
        async logout({dispatch,commit})
        {

            await axios.post({
                method: 'post',
                url: 'api/auth/logout',
            })
            .then(response => {
                commit('set_token',null);
                commit('set_user',null);
            })
        },
    }
})