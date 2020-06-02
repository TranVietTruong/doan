import Forum from './pages/ForumComponent';
//************************************************
import ListQuestion from './components/forum/ListQuestionComponent';
import DetailQuestion from './components/forum/DetailQuestionComponent';
import PostQuestion from './components/forum/PostQuestionComponent';
//************************************************

import News from './pages/NewsComponent.vue';
//************************************************
import ListNews from './components/news/ListNewsComponent.vue';
import DetailNews from './components/news/DetailNewsComponent.vue';
//************************************************


import Chat from './pages/ChatComponent.vue';

import Home from './pages/HomeComponent';
import Login from './pages/LoginComponent.vue';
import Register from './pages/RegisterComponent.vue';
import Error404 from './pages/404Component.vue';



import store from './vuex';

const Authenticated = (to, from, next) => {

    if (!store.getters['authenticated']) {
        return next({ name: 'login' });

    }
    return next();

};

const isAuthenticated = (to, from, next) => {

    if (store.getters['authenticated']) {
        return next({ name: 'listquestion' });

    }
    return next();

};

export const routes = [{
        path: '/',
        name: 'home',
        component: Home,
        children: [],
        beforeEnter: isAuthenticated
    },
    {
        path: '/dien-dan',
        name: 'question',
        component: Forum,
        children: [{
                path: '',
                name: 'listquestion',
                component: ListQuestion,
                beforeEnter: Authenticated
            },
            {
                path: 'dat-cau-hoi',
                name: 'postquestion',
                component: PostQuestion,
                beforeEnter: Authenticated
            },
            {
                path: ':slug',
                name: 'detailquestion',
                component: DetailQuestion,
                beforeEnter: Authenticated
            },

        ],
    },
    {
        path: '/tin-tuc',
        name: 'news',
        component: News,
        children: [{
                path: '',
                name: 'listnews',
                component: ListNews,
                beforeEnter: Authenticated
            },
            {
                path: ':slug',
                name: 'detailnews',
                component: DetailNews,
                beforeEnter: Authenticated
            },
        ],
    },
    {
        path: '/tu-van',
        name: 'chat',
        component: Chat,
        beforeEnter: Authenticated
    },
    {
        path: '/dang-nhap',
        name: 'login',
        component: Login,
        children: [],
        beforeEnter: isAuthenticated
    },
    {
        path: '/dang-ky',
        name: 'register',
        component: Register,
        children: [],
        beforeEnter: isAuthenticated
    },
    {
        path: '404',
        name: '404',
        component: Error404,
        //beforeEnter: isAuthenticated
    }
]