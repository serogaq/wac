<template>
    <Layout>
        <header>
            <slot name="header"></slot>
        </header>
        <main>
            <slot name="main"></slot>
        </main>
        <footer>
            <slot name="footer"></slot>
        </footer>
    </Layout>
</template>

<script>
export default {
    name: 'BaseLayout',
}
</script>

<style scoped></style>
