module.exports = {
    devServer: {
        proxy: {
         '^api': {
            target: 'http://backend.svc.cluster.local:5000',
            changeOrigin: true,
            logLevel: 'debug',
            pathRewrite: { '^api': '/'},
         }   
        }
    }
}