<template>
    <div class="board-lists">
        <div v-for="(board_list, index) in allBoardLists" v-bind:id="board_list.id" class="board-list">
            <div class="input-area">
                <h6 v-bind:for="'board_list_' + board_list.id" v-text="board_list.name" v-on:click="switchBoardListName" id="board-text"></h6>
                <input type="text"
                       v-model="updateBoardList" v-on:keyup.enter="updateBoardListName(board_list.id, index, arguments[0])" id="board-input" style="display: none">
            </div>
            <draggable element="ul" :options="{ group: 'board_list.cards.edges' }" v-for="edge in board_list.cards.edges" @start="dragStart()" @end="dragEnd()" :key="edge.node.id" class="card-list">
                <li v-bind:for="'card_' + edge.node.id" v-text="edge.node.name" v-on:click="" class="card"></li>
            </draggable>
            <ul>
                <li class="new-card">
                    <input v-model="allBoardLists[index].inputBox" type="text" v-bind:id="board_list.id" class="form-control">
                    <input type="button" value="カードを追加" v-on:click="createCard(board_list.id, index)" class="form-control" >
                </li>
            </ul>
        </div>
        <div class="board-list">
            <input v-model="newBoardList" type="text" class="form-control">
            <input type="button" value="ボードを追加" v-on:click="createBoardList" class="form-control" >
        </div>
    </div>
</template>

<script>
    import gql from 'graphql-tag'
    import draggable from 'vuedraggable';

    const BOARD_LIST_QUERY = gql`
    query allBoardLists($project: ID!){
        allBoardLists(project: $project) {
            cards {
                edges {
                    node {
                        id
                        name
                        detail
                    }
                }
            }
            id
            name
        }
    }`
    const CREATE_BOARD_LIST = gql`
     mutation createBoardList($name: String!, $project: ID!) {
        createBoardList(name: $name, project: $project) {
            boardList {
                cards {
                    edges {
                        node {
                            id
                            name
                            detail
                        }
                    }
                }
              id
              name
            }
        }
     }`

    const UPDATE_BOARD_LIST = gql`
    mutation updateBoardList($id: ID!, $name: String!) {
        updateBoardList(id: $id, name: $name) {
            boardList {
                cards {
                    edges {
                        node {
                            id
                            name
                            detail
                        }
                    }
                }
              id
              name
            }
        }
     }
    `
    const CREATE_CARD = gql`
     mutation createCard($name: String!, $boardList: ID!) {
        createCard(name: $name, boardList: $boardList) {
            card {
                id
                name
                detail
            }
        }
    }
    `

export default {
    name: 'board_list',
    components: {
        draggable,
    },
    data () {
        return {
            list: [],
            inputBox:[],
            allBoardLists: [],
            cards: [],
            newBoardList: '',
            updateBoardList: '',
            newCard: ''
        }
    },
    created() {
       this.$apollo.query({
           query: BOARD_LIST_QUERY,
           variables: {
               project: location.pathname.split('/')[2]
           }
       }).then(response => {
           this.allBoardLists = response.data.allBoardLists
           response.data.allBoardLists.forEach(s =>{
               this.inputBox.push({ velue: 0 })
           })
       })
    },
    methods: {
        createBoardList: function() {
            this.$apollo.mutate({
                mutation: CREATE_BOARD_LIST,
                variables: {
                    name: this.newBoardList,
                    project: location.pathname.split('/')[2]
                }
            }).then((response) => {
                console.log(response.data.createBoardList.boardList.name)
                this.allBoardLists.push(response.data.createBoardList.boardList);
                this.newBoardList = ''
            }, (error) => {
                console.log(error);
            });
        },
        updateBoardListName: function (board_list_id, index, e) {
            this.$apollo.mutate({
                mutation: UPDATE_BOARD_LIST,
                variables: {
                    id: board_list_id,
                    name: this.updateBoardList
                }
            }).then((response) => {
                e.target.style.display="none";
                document.getElementById("board-text").style.display="";
                this.allBoardLists[index] = response.data.board_list;
                location.reload();
            }, (error) => {
                console.log(error);
            });
        },
        createCard: function (board_list, index) {
            this.$apollo.mutate({
                mutation: CREATE_CARD,
                variables: {
                    name: this.allBoardLists[index].inputBox,
                    boardList: board_list
                }
            }).then((response) => {
                this.allBoardLists[index].cards.edges.push({node: response.data.createCard.card })
                this.allBoardLists[index].inputBox = ''
            }, (error) => {
                console.log(error);
            });
        },
        onstart: (e) => {
            console.log("onstart")
            console.log(e)
        },
        onend: (e) => {
            console.log("onend")
            console.log(e)
        },
        switchBoardListName: function (e) {
            e.currentTarget.style.display="none";
            e.target.nextElementSibling.style.display="";
        }
    }
}
</script>

<style scoped>
    .board-lists{
        overflow-x:scroll;
        width: 200vw;
        padding-top: 8vmax;
    }
    .board-list{
        vertical-align: top;
        width: 250px;
        display: inline-block;
        background-color: #EFEFEF ;
        padding: 20px;
        margin : 30px;
        border: solid 2px #008080;
    }
    #board-text {
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