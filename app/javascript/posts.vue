<template>
  <v-app id="app">
    <v-container>
      <v-data-table
        :headers="headers"
        :items="items"
        :items-per-page="itemsPerPage"
      />
    </v-container>
    <v-pagination v-model="currentPage" :length="totalPages" @input="fetchPosts"></v-pagination>
  </v-app>
</template>

<script>
export default {
  data: () => {
    return {
      headers: [
          { text: "ID", value: "id"},
          { text: "Title", value: "title"},
      ],
      items: [],
      currentPage: 1,
      itemsPerPage: 10,
      totalPages: null
    }
  },
  methods: {
    fetchPosts() {
      fetch(`/api/posts?page=${this.currentPage}`, {
        method: 'GET',
        headers: { 'X-Requested-With': 'XMLHttpRequest'},
        credentials: 'same-origin',
        redirect: 'manual'
      })
        .then(response => {
          return response.json()
        })
        .then(
          json => {
          this.items = json.posts;
          this.totalPages = json.total_pages;
      })
    }
  },
  created(){
    this.fetchPosts()
  }
}


</script>
