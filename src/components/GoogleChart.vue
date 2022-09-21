<script>
import { defineComponent, h } from 'vue';

import { GChart } from 'vue-google-charts';

export const type = 'BarChart';

export const data = 
[
  ['City', '2010 Population'],
  [ 'T',  8175000],
  [ 'A',  175000],
  [ 'O',  4175000],
];


export const options = {
  title: 'Population of Largest U.S. Cities',
  chartArea: { width: '50%' },
  hAxis: {
    title: 'Total Population',
    minValue: 0,
  },
  vAxis: {
    title: 'City',
  },
  width: 800,
  height: 600,
};

export default defineComponent({
  name: 'GoogleChart',
  components: {
    GChart,
  },
  props :{
    data: Array,
  },
  setup() {
    return () =>
      h(GChart, {
        data,
        options,
        type,
      });
  },
});

</script>