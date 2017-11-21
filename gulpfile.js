const gulp = require('gulp');
const mocha = require('gulp-mocha');

// Run SASS Unit test
gulp.task('test', () => {
    return gulp.src('test.js', {
            read: false
        })
        // `gulp-mocha` needs filepaths so you can't have any plugins before it
        .pipe(mocha({
            reporter: 'nyan'
        }))
})

// Default task
gulp.task('default', () => {
    gulp.watch('**/*scss', ['test']);
});