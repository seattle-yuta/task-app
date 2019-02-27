import Vue from 'vue/dist/vue.esm.js'
import Router from './router/router'
import Header from './components/header.vue'
import VueApollo from 'vue-apollo'
import ApolloClient from "apollo-boost"

const apolloClient = new ApolloClient({
    uri: "http://localhost:3000/graphql"
});

const apolloProvider = new VueApollo({
    defaultClient: apolloClient
});

Vue.use(VueApollo)

var app = new Vue({
    router: Router,
    apolloProvider,
    el: '#app',
    components: {
        'navbar': Header,
    }
});