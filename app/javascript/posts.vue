<template lang='pug'>
  <div id="app">
    <p>{{ posts }}</p>
  </div>
</template>

<script>
export default {
  // components: {
  //   'post': Post
  // },
  data: () => {
    return {
      posts: []
    }
  },
  created() {
    fetch('/api/posts.json', {
      method: 'GET',
      headers: { 'X-Requested-With': 'XMLHttpRequest', },
      credentials: 'same-origin',
      redirect: 'manual'
    })
        .then(response => {
          return response.json()
        })
        .then(json => {
          setTimeout(function(){
            json.forEach(r => { this.posts.push(r) })
          }.bind(this), 2000)
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
  },
  computed: {
    myposts(){
      setTimeout(function(){
        return this.posts
      }.bind(this), 10000)
    }
  }
}


</script>
