document.addEventListener("turbolinks:load", function() {
  var canvas3dExist = document.getElementById('canvas3d');
  var drawingBox = document.getElementById('drawing-box');
  if (canvas3dExist != null){

  // Set up the scene, camera, and renderer as global variables.
  var scene, camera, renderer;

  init();
  animate();

  // Sets up the scene.
  function init() {

  // Create the scene and set the scene size.
  scene = new THREE.Scene();
    var WIDTH = document.getElementById('canvas3d').clientWidth,
        HEIGHT = document.getElementById('canvas3d').clientHeight;

  // Create a renderer and add it to the DOM.
  renderer = new THREE.WebGLRenderer({antialias:true});
  renderer.setSize(WIDTH, HEIGHT);

    document.getElementById('canvas3d').appendChild(renderer.domElement);

  // Create a camera, zoom it out from the model a bit, and add it to the scene.
  camera = new THREE.PerspectiveCamera(45, WIDTH / HEIGHT, 0.1, 20000);
  camera.position.set(0,6,0);
  scene.add(camera);

  // Create an event listener that resizes the renderer with the browser window.
  window.addEventListener('resize', function() {
    var WIDTH = window.innerWidth,
  HEIGHT = window.innerHeight;
  renderer.setSize(WIDTH, HEIGHT);
  camera.aspect = WIDTH / HEIGHT;
  camera.updateProjectionMatrix();
  });

  // Set the background color of the scene.
  renderer.setClearColor(0x333F47, 1);

  // Create a light, set its position, and add it to the scene.
  var light = new THREE.PointLight(0xffffff);
  light.position.set(-100,200,100);
  scene.add(light);

  // Load in the mesh and add it to the scene.
    var loader = new THREE.JSONLoader();

    var drawingTarget = drawingBox.getAttribute('drawing-target');
  loader.load( "/drawing/get_json/"+drawingTarget,  function(geometry){
    var material = new THREE.MeshLambertMaterial({color: 0x55B663});
  mesh = new THREE.Mesh(geometry, material);
  scene.add(mesh);
  });

  // Add OrbitControls so that we can pan around with the mouse.
  controls = new THREE.OrbitControls(camera, renderer.domElement);

  }


  // Renders the scene and updates the render as needed.
  function animate() {

    // Read more about requestAnimationFrame at http://www.paulirish.com/2011/requestanimationframe-for-smart-animating/
  requestAnimationFrame(animate);

  // Render the scene.
  renderer.render(scene, camera);
  controls.update();

  }
  }
})
