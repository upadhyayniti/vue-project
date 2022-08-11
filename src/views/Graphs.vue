<script>
import HorizontalBar from "../components/HorizontalBar.vue";

export default {
  name: 'Graphs',
  components: {
    HorizontalBar,
  },
  async created() {
      this.entries = await this.fetchEntries()
  },
  data() { 
    return {
      entries : [],
      columns: ["letter", "frequency"] ,
      format : "%"
    }
  },
  methods : {
    async fetchEntries() {
      console.log('here 1')
      const res = await fetch(`http://localhost:5000/entries`)

      const data = await res.json()

      return data
    },
  },

}
</script>

<template>
<HorizontalBar :entries="entries" :columns="columns" :format="format" />
</template>

<style>

</style>
