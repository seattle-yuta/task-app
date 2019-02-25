import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Project from '../components/project'
import BoardList from '../components/board_list'

Vue.use(VueRouter);

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/board_lists/:project_id', name: 'BoardList', component: BoardList },
        { path: '/projects', component: Project}
    ],
})