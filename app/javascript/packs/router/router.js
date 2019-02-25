import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Project from '../components/project'
import List from '../components/list'

Vue.use(VueRouter);

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/list', component: List },
        { path: '/project', component: Project}
    ],
})