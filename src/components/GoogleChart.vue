<script>
import { defineComponent, h } from 'vue';

import { GChart } from 'vue-google-charts';

import CouchServer from './Couchbase.vue'

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

/* const text = '{"requestID": "615e0b26-dd61-4a1a-bda9-22333193b982", "results": [   {"name": "Number 1 Youth Hostel","signature": "json"},{"name": "Medway Youth Hostel","signature": "array"} ],  "status": "success", "signature": {"name": "json" }}';
const obj = JSON.parse(text);
const keys = Object.keys(obj.results[0])

let abc = '';
let newArray = [];	

// expand to have the correct amount or rows
newArray.push( [] );

keys.forEach(makeArray);
newArray.forEach(myFunction);


function makeArray(item, index) {
	newArray[0].push(item);
    newArray.push([obj.results[index].name,obj.results[index].signature]);
}

function myFunction(item, index) {
  abc += index + ": " + item + "<br>"; 
}


document.getElementById("demo").innerHTML = abc;


0: name,signature
1: Number 1 Youth Hostel,json
2: Medway Youth Hostel,array

*/
</script>
