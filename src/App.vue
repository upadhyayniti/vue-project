<template>

    <!-- div v-for="post in posts" :key="post.id">
    <h2>{{ post.id }} {{ post.title }}</h2>
    <p>{{ post.body }}</p>
  </!-->
  <div class="container">
    <Header @toggle-add-task="toggleAddTask" 
            title="Task Tracker" 
            :showAddTask="showAddTask"/>

    <router-view :showAddTask="showAddTask"></router-view>

    <Footer />
  </div>
</template>

<script>
import Header from './components/Header.vue';
import Footer from './components/Footer.vue';
import axios from 'axios';
 
export default {
  name: 'App',
  components: {
    Header,
    Footer
  },
  data() {
    return {
      posts: [],
      showAddTask: false
    }
  },
  methods: {

    toggleAddTask() {
      this.showAddTask = !this.showAddTask
    },
  },
  mounted() {
    axios
    .get('https://jsonplaceholder.typicode.com/posts/')
    .then((response) => {
        this.posts = response.data
//        console.log(response)
      })
  }
}

</script>


<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  .container {
    border: 1px solid red;
    margin: 30px auto;
    min-height: 300px;
    padding: 30px;
    border-radius: 5px;

  }

  .btn {
    display: inline-block;
    background: #000;
    color: #fff;
    border: none;
    padding: 10px 20px;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    font-size: 15px;
    font-family: inherit;
  }

  .btn:focus {
    outline: none;
  }
}
</style>
