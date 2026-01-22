// Access the DOM elements
const video = document.getElementById('camera');
const canvas = document.getElementById('photo');
const captureBtn = document.getElementById('capture-btn');
const context = canvas.getContext('2d');

// Request access to the user's camera
navigator.mediaDevices.getUserMedia({ video: true })
    .then((stream) => {
        video.srcObject = stream;
    })
    .catch((error) => {
        console.error("Error accessing the camera: ", error);
    });

// Capture photo on button click
captureBtn.addEventListener('click', () => {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    context.drawImage(video, 0, 0, canvas.width, canvas.height);
});

// Create a download link for the captured photo
const downloadLink = document.createElement('a');
downloadLink.innerText = 'Download Photo';
document.body.appendChild(downloadLink);

captureBtn.addEventListener('click', () => {
    // Capture photo and draw to canvas
    context.drawImage(video, 0, 0, canvas.width, canvas.height);

    // Convert the canvas image to a data URL
    const dataURL = canvas.toDataURL('image/png');
    
    // Set the download link
    downloadLink.href = dataURL;
    downloadLink.download = 'captured-photo.png';
    downloadLink.style.display = 'block';
});