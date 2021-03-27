<template>
    <router-view />
</template>

<script>
import { computed, watch } from 'vue'
import titleMixin from './mixins/titleMixin'
import API from './helpers/api'

export default {
    name: 'App',
    mixins: [titleMixin],
    data() {
        return {
            App: {
                helpers: {
                    $api: API,
                },
                title: 'Web App Creator',
                appHeader: 'App',
            }
        }
    },
    provide() {
        return {
            App: computed(() => this.App),
        }
    },
    title() {
        return this.App.title
    },
    created() {
        watch(this.App, () => this.__updatePageTitle())
    }
}
</script>

<style></style>
