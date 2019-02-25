<template>
    <ul class="collection">
        <li v-for="project in projects" v-bind:id="'row_project_' + project.id" class="collection-item">
          <label v-bind:for="'project_' + project.id">{{ project.name }}</label>
        </li>
    </ul>
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