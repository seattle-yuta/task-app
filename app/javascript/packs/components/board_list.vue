<template>
    <div class="board-lists">
        <div v-for="(board_list, index) in board_lists" v-bind:id="board_list.id" class="board-list">
            <div class="input-area">
                <h6 v-bind:for="'board_list_' + board_list.id" v-text="board_list.name" v-on:click="switchBoardListName" class="board-text"></h6>
                <input v-if="edit" type="text"
                       v-model="updateBoardList" v-on:keyup.enter="updateBoardListName(board_list.id, index)" class="board-input">
            </div>
            <ul class="card-list">
                <li class="card">aaa</li>
                <li class="card">bbb</li>
                <li class="card">ccc</li>
            </ul>
        </div>
        <div class="board-list">
            <input v-model="newBoardList" type="text" class="form-control">
            <input type="button" value="ボードを追加" v-on:click="createBoardList(board_lists)" class="form-control" >
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    export default {data: function () {
            return {
                board_lists: [],
                newBoardList: '',
                updateBoardList: ''
            }
        }, mounted: function () {
            this.fetchBoardLists();
        }, methods: {
            fetchBoardLists: function () {
                axios.get('/api' + location.pathname).then((response) => {
                    for(var i = 0; i < response.data.board_lists.length; i++) {
                        this.board_lists.push(response.data.board_lists[i]);
                    }
                }, (error) => {
                    console.log(error);
                });
            },
            updateBoardListName: function (board_list_id, index) {
                axios.patch('/api/board_lists/' + board_list_id, {
                    board_list: {
                        name: this.updateBoardList
                    }
                }).then((response) => {
                    this.board_lists[index] = response.data.board_list;
                }, (error) => {
                    console.log(error);
                });
            },
            createBoardList: function () {
                axios.post('/api/board_lists/', {
                    board_list: {
                        name: this.newBoardList,
                        project_id: location.pathname.split('/')[2]
                    }
                }).then((response) => {
                    this.board_lists.push(response.data.board_list);
                    this.newBoardList = '';
                }, (error) => {
                    console.log(error);
                });
            },
            switchBoardListName: function (e) {
                console.log("sssss")
                e.style.display = 'none';
            }
        }
    }
</script>

<style scoped>
    .board-list{
        width: 250px;
        display: inline-block;
        background-color: #EFEFEF ;
        padding: 20px;
        margin : 30px;
        border: solid 2px #008080;
    }
    .board-text {
        size: 20px;
        text-align: center;
        width: 80%;
    }
    .card-list {
        padding-left: 0;
    }
    .card {
        background: #CCC;
        height: 50px;
        padding: 10px;
        margin: 10px;
    }
</style>