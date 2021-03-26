module.exports = {
	publicPath: process.env.NODE_ENV === 'production' ? '/' : '/',
	devServer: {
		proxy: {
			'^/api': {
				target: 'https://serogaq.online/',
				ws: false,
				changeOrigin: true
			},
		}
	},
	productionSourceMap: false
};
