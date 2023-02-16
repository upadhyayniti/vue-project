<script>
import GoogleChart from '../components/GoogleChart.vue'

import HorizontalBar from "../components/HorizontalBar.vue";

export default {
  name: 'Graphs',
  components: {
    GoogleChart,
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

      const res = await fetch(`http://localhost:5000/entries`)

 //     const res = await fetch(`http://queryservice-couchbase.apps.cluster-2qjs8.2qjs8.sandbox1894.opentlc.com/query/service?statement=select population as \`value\`,address.city as \`name\` from \`cb-bucket\`._default._default where address.city is not null   -u Administrator:password`)

      const rdata = await res.json()
//output = rdata.map(x => Object.entries(x).reduce((a, [k, v]) => ({...a, [rdata[0][k]]: v}), {}));

      return rdata
    },
  },

}
</script>

<template>
<GoogleChart :data="entries"/>

<HorizontalBar :entries="entries" :columns="columns" :format="format" /> 
</template>

<style>

</style>
