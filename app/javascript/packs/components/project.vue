<template>
    <div class="projects">
        <div v-for="(project) in allProjects" v-bind:id="'row_project_' + project.id" class="project">
            <label v-bind:for="'project_' + project.id">名前</label>
            <router-link :to="{ name: 'BoardList', params: { project_id: project.id }} ">{{ project.name }}</router-link>
        </div>
        <div class="new-project">
            <input v-model="newProject" type="text" class="input-project">
            <input type="button" value="プロジェクトを追加" v-on:click="createProject" >
        </div>
    </div>
</template>

<script>
    import gql from 'graphql-tag'
    const CREATE_PROJECT = gql`
      mutation createProject($name: String!) {
        createProject(name: $name) {
            project {
              id
              name
            }
        }
      }
    `

    const PROJECTS_QUERY = gql`
    query allProjects{
      allProjects {
        id
        name
      }
    }`
    export default {
        name: 'project',
        data () {
            return {
                allProjects: [],
                newProject: []
            }
        },
        apollo: {
            allProjects: {
                query:PROJECTS_QUERY
            }
        },
        methods: {
            createProject: function() {
                this.$apollo.mutate({
                    mutation: CREATE_PROJECT,
                    variables: {
                        name: this.newProject
                    }
                }).then((response) => {
                    this.allProjects.push(response.data.createProject.project);
                    this.newProject = ''
                }, (error) => {
                    console.log(error);
                });
            }
        }
    }
</script>

<style scoped>
    .input-project{
        width: 50%;
    }
    .project{
        display: inline-block;
        background-color:  #ccc;
        border: solid 2px #039be5;
        padding: 50px;
        margin : 30px;
    }
    .new-project{
        background-color:  #EFEFEF;
        padding: 20px;
        margin : 10px;
    }
</style>