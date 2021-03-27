import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import * as Compositions from './components/Сompositions'

let app = createApp(App)

app.component('Layout', Compositions.DefaultСomposition.Layout)
app.component('BaseLayout', Compositions.DefaultСomposition.BaseLayout)
app.component('ViewLayout', Compositions.DefaultСomposition.ViewLayout)

app.use(router)

app.mount('#app')
