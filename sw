// Service Worker (通知受信用)
self.addEventListener('push', function(event) {
    const data = event.data ? event.data.json() : {};
    const title = data.title || 'タスク確認の時間です';
    const options = {
        body: data.body || '朝・昼・晩のチェックを行いましょう！',
        icon: 'https://cdn-icons-png.flaticon.com/512/3256/3256013.png'
    };

    event.waitUntil(
        self.registration.showNotification(title, options)
    );
});

self.addEventListener('notificationclick', function(event) {
    event.notification.close();
    event.waitUntil(
        clients.openWindow('/')
    );
});
