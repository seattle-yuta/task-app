<template>
    <div class="projects">
        <div v-for="project in projects" v-bind:id="'row_project_' + project.id" class="project">
          <label v-bind:for="'project_' + project.id">名前</label>
            <router-link :to="{ name: 'BoardList', params: { project_id: project.id }} ">{{ project.name }}</router-link>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    export default {data: function () {
            return {
                projects: [],
                newProject: ''
            }
        }, mounted: function () {
            this.fetchProjects();
        }, methods: {
            fetchProjects: function () {
                axios.get('/api/projects').then((response) => {
                    for(var i = 0; i < response.data.projects.length; i++) {
                        this.projects.push(response.data.projects[i]);
                    }
                }, (error) => {
                    console.log(error);
                });
            },
        }
    }
</script>

<style scoped>
    .project{
        display: inline-block;
        background-color:  #ccc;
        padding: 50px;
        margin : 30px;
    }
</style>