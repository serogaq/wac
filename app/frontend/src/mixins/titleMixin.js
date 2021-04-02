function getTitle(vm) {
    const { title } = vm.$options
    if(title) return typeof title === 'function' ? title.call(vm) : title
}

export default {
    created() {
        this.__updatePageTitle()
    },
    methods: {
        __updatePageTitle() {
            const title = getTitle(this)
            if(title && title !== document.title) document.title = title
        }
    }
}
