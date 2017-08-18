//https://github.com/dlmanning/gulp-sass
var gulp = require('gulp'),
	uglify = require('gulp-uglify'),
	sass = require('gulp-sass'),
	plumber = require('gulp-plumber'),
	gulpConcat = require('gulp-concat');

function errorLog(error){
	console.error.bind(error);
	this.emit('end');
}


//Javascript taks
gulp.task('js', function () {
    return gulp.src('js/app/**/*.js') //select all javascript files under js/ and any subdirectory
        .pipe(gulpConcat('js/scripts.min.js')) //the name of the resulting file
        .pipe(uglify())
        .pipe(gulp.dest('./')) //the destination folder
        //.pipe(notify({ message: 'Finished minifying JavaScript'}));
});


//Styles and sass taks
gulp.task('sass', function () {
  gulp.src('css/**/*.scss')
    .pipe(sass.sync()
	.pipe(sass({outputStyle: 'compressed'}))
	.on('error', sass.logError))
    .pipe(gulp.dest('./css'));
});


//Watch for changes
gulp.task('watch', function(){
	//gulp.watch('**/*.js', ['scripts']);
	//gulp.watch('styles.scss', ['sass']);
});

gulp.task('default', ['js', 'sass']);
