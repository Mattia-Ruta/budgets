module.exports = function(grunt) {
    grunt.initConfig({
        uglify: {
            my_target: {
                files: {
                    "static/lupobudgets.min.js": ["static/js/*.js"]
                }
            }
        },
        cssmin: {
            target: {
                files: {
                    "static/lupobudgets.min.css": ["static/css/*.css"]
                }
            }
        }
    });

    // Load plugins
    grunt.loadNpmTasks("grunt-contrib-uglify");
    grunt.loadNpmTasks("grunt-contrib-cssmin");

    // Default tasks
    grunt.registerTask("default", [
        "uglify",
        "cssmin",
    ]);

};



