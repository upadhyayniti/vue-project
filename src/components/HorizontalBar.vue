<script>
import { defineComponent, computed } from 'vue'
import { scaleLinear, scaleBand, max, range } from 'd3'

export default defineComponent({
  name: 'HorizontalBar',
  props: {
    entries: Array,
    columns: Array,
    format: String
  },
  setup(props) {
    const margin = {
      top: 30,
      right: 45,
      bottom: 10,
      left: 45
    }
    const barHeight = 25
    const width = 945
    const height = Math.ceil((props.entries.length + 0.1) * barHeight) + margin.top + margin.bottom

    const x = computed(() => scaleLinear().domain([0, max(props.entries, (d) => d.value)]).range([margin.left, width - margin.right]))

    const y = computed(() => scaleBand().domain(range(props.entries.length)).rangeRound([margin.top, height - margin.bottom]).padding(0.1))

    const formattedText = computed(() => x.value.tickFormat(20, props.format))

    const maxNumber = computed(() => {
      const formatNumber = formattedText.value(max(props.entries, d => d.value)).slice(0, -1)
      return Math.ceil(Number(formatNumber))
    })

    return {
      margin,
      barHeight,
      width,
      height,
      x,
      y,
      formattedText,
      maxNumber
    }
  }
})
</script>

<template>
  <div class="graph">
    <svg :viewBox="`0 0 ${width} ${height}`" xmlns="http://www.w3.org/2000/svg">
      <g v-for="(entry, index) in entries" :key="'bar-'+index" fill="seagreen">
        <rect :x="x(0)" :y="y(index)" :width="Number(x(entry.value)) - Number(x(0))" :height="y.bandwidth()" />
      </g>
      <g v-for="(entry, index) in entries" :key="'text-'+index" fill="white">
        <text :x="x(entry.value)" :y="Number(y(index)) + Number(y.bandwidth()) / 2" dx="-45" dy="0.35em">{{ formattedText(entry.value) }}</text>
      </g>
      <g :transform="`translate(0, ${margin.top})`">
        <g v-for="(num, index) in maxNumber" :key="'x-'+num" opacity="1" :transform="`translate(${Number(x(index)) / 101 + 45}, 0)`">
          <line stroke="darkgreen" y2="-6"></line>
          <text fill="darkgreen" x="-4" y="-9" dy="0em">{{ index + format }}</text>
        </g>
      </g>
      <g :transform="`translate(${margin.left}, 0)`">
        <path class="domain" stroke="darkgreen" d="M0.5,30.5V683.5"></path>
        <g v-for="(entry, index) in entries" :key="'y-'+index" opacity="1" :transform="`translate(0, ${Number(y(index)) + 12})`">
          <line stroke="darkgreen" x2="-6"></line>
          <text fill="darkgreen" x="-25" dy="0.32em">{{ entry.name }}</text>
        </g>
      </g>
    </svg>
  </div>
</template>

<style scoped>

.graph {
  min-height : 500px;
  min-width  : 1024px;
}

</style>