require('./bootstrap');

window.Vue = require('vue');

// ============= VUETIFY ==================
import Vue from 'vue';
import Vuetify from 'vuetify';
Vue.use(Vuetify);
// ============= END VUETIFY ==============


//============== VUE ROUTER ==============================
import VueRouter from 'vue-router';
Vue.use(VueRouter);
import { routes } from './routes';
const router = new VueRouter({ mode: 'history', routes });
//============== END VUEROUTER ==============================


//=============== VUE EDITOR ============================
import Vue2Editor from "vue2-editor";
Vue.use(Vue2Editor)
    //================ END VUE EDITOR =======================


//================ SWEETALERT =======================
import Swal from 'sweetalert2';
window.Swal = Swal;
//=============  END SWEETALERT ====================================

//================ CORS VUEJS =======================
import cors from 'vue-axios-cors';
Vue.use(cors);
//================ END =======================

//================ VUEX ==================================
import store from './vuex';
store.subscribe((mutation) => {

    switch (mutation.type) {
        case 'set_token':
            if (mutation.payload) {

                window.axios.defaults.headers.common['Authorization'] = 'Bearer ' + mutation.payload;
                localStorage.setItem('access_token', mutation.payload);
            } else {
                window.axios.defaults.headers.common['Authorization'] = null;
                localStorage.removeItem('access_token');
            }
            break;
    }

});
//================ END VUEX ==============================


export const eventBus = new Vue();

store.dispatch('get_user', localStorage.getItem('access_token')).then(() => {
    const app = new Vue({
        vuetify: new Vuetify(),
        el: '#app',
        router,
        store,
        created() {
            this.$vuetify.theme.dark = true
        }
    });
});