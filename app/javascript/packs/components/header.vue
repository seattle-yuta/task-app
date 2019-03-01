<template>
    <div class="todo-header">
        <ul id="dropdown" class="dropdown-content">
            <li><router-link to="/">Top</router-link></li>
        </ul>
        <nav>
            <div class="nav-wrapper container">
                <a href="/" class="brand-logo left">Todo Application</a>
                <ul class="right hide-on-med-and-down">
                    <li><router-link to="/projects">project</router-link></li>
                    <li><a href="/logout">ログアウト</a></li>
                </ul>
                <ul class="right hide-on-large-only">
                    <li>
                        <a class="dropdown-button" href="#!" data-activates="dropdown">
                            Menu<i class="material-icons right">arrow_drop_down</i>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</template>

<style scoped>
    .todo-header{
        width: 100%;
        position: fixed;
    }
</style>